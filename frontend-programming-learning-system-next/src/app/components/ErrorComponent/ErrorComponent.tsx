'use client'

import {useState} from 'react'
import ErrorLine from '@/app/components/ErrorComponent/ErrorLine'
import SelectErrorDisplay from '@/app/components/ErrorComponent/SelectErrorDisplay'
import ErrorAnotherSystem from "@/app/components/ErrorComponent/ErrorAnotherSystem";

type ErrorComponentProps = {
    programCode: string
    compileErrorMessage: string
}

export default function ErrorComponent({programCode, compileErrorMessage}: ErrorComponentProps){

    const tabTypes = ['', 'エラー線', 'エラー解析']
    const [activeTab, setActiveTab] = useState('')

    return (
        <div className={"h-full flex flex-col"}>
            <SelectErrorDisplay tabTypes={tabTypes} activeTab={activeTab} setActiveTabAction={setActiveTab}/>
            {activeTab && compileErrorMessage.includes('Compile error:') &&
                <div className={"h-full flex"}>
                    {activeTab === 'エラー線' && <ErrorLine compileErrorMessage={compileErrorMessage}/>}
                    {activeTab === 'エラー解析' && <ErrorAnotherSystem programCode={programCode} compileErrorMessage={compileErrorMessage}/>}
                </div>
            }
        </div>
    )
}



