type compileAndRunProps ={
    programCode: string
    programInput: string
}

export async function compileAndRunWithBackend({programCode, programInput}: compileAndRunProps): Promise<string> {

    const apiUrl = process.env.NEXT_PUBLIC_COMPILE_AND_RUN_API_URL

    if (!apiUrl) throw new Error('環境変数 NEXT_PUBLIC_COMPILE_AND_RUN_API_URL が未定義です')

    try {
        const response = await fetch(apiUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                program: programCode,
                input: programInput,
            }),
        })

        if (!response.ok) {
            throw new Error('通信エラー')
        }

        const data = await response.json()
        return data.compileErrorExecutionResult as string
    } catch (error) {
        console.error('fetch error:', error)
        throw error
    }
}