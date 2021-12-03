import React from 'react';
import Image from '../images/police.jpeg';
import {Section, HeroBg, HeroContent, SectionText, ImageBg} from '../css/Home';

export default function Home () {

    return (
        <Section>
            <ImageBg/>
            <HeroContent>
                <SectionText>Police Database<br/>Management System</SectionText>
            </HeroContent>
        </Section>
    )
}