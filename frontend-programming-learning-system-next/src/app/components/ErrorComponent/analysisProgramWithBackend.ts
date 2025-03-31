export type AnalysisError = {
    line_number: number
    error_type: string
    error_message: string
    correct_grammar: string[]
}
export type AnalysisResult = {
    print_error_messages: AnalysisError[]
}

export default async function analysisProgramWithBackend(programCode: string): Promise<AnalysisResult> {

    const apiUrl = process.env.NEXT_PUBLIC_ANALYSIS_ERROR_API_URL
    if (!apiUrl) throw new Error('環境変数 NEXT_PUBLIC_ANALYSIS_ERROR_API_URL が未定義です')

    try {
        const response = await fetch(apiUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ program: programCode }),
        })

        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`)

        const text = await response.text();
        const data = JSON.parse(text);

        return {
            print_error_messages: data.print_error_messages || [],
        }
    } catch (error) {
        console.error("Error:", error)
        throw error
    }
}