'use client'

import {useEffect, useRef, useState} from 'react'
import {MdKeyboardArrowDown} from "react-icons/md";

type SelectErrorDisplayProps = {
    tabTypes: string[]
    activeTab: string
    setActiveTabAction: React.Dispatch<React.SetStateAction<string>>
}

export default function SelectErrorDisplay({tabTypes, activeTab, setActiveTabAction}: SelectErrorDisplayProps){

    const [open, setOpen] = useState(false)
    const menuRef = useRef<HTMLDivElement>(null)

    //外側クリックで選択リストを閉じる処理
    useEffect(() => {
        const handleClickOutside = (event: MouseEvent) => {
            if (menuRef.current && !menuRef.current.contains(event.target as Node)) setOpen(false)
        }
        document.addEventListener('mousedown', handleClickOutside)
        return () => document.removeEventListener('mousedown', handleClickOutside)
    }, [])


    return (
        <div className="relative w-50" ref={menuRef}>
            <button onClick={() => setOpen(!open)} className="w-full text-left">
                <div className={"flex"}>
                    {activeTab} <div className={"flex items-center"}><MdKeyboardArrowDown /></div>
                </div>
            </button>
            {open && (
                <div className="absolute w-full mt-1 border rounded bg-white shadow z-20">
                    {tabTypes.map((option) => (
                        <div
                            key={option}
                            onClick={() => {
                                setActiveTabAction(option)
                                setOpen(false)
                            }}
                            className="px-2 py-1 rounded hover:bg-gray-100 cursor-pointer"
                        >
                            {option === '' ? "---" : option}
                        </div>
                    ))}
                </div>
            )}
        </div>
    )
}