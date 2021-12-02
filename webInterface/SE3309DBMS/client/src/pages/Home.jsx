import React from 'react';

import {Section, HeroBg, HeroContent, SectionText, ImageBg} from '../css/Home';

export default function Home () {

    return (
        <Section>
           
            <HeroBg>
                <ImageBg/>
            </HeroBg>
            <HeroContent>
                <SectionText>Police Database<br/>Management System</SectionText>
            </HeroContent>
        </Section>
    )
}