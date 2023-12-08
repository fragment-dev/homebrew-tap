require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4123.0.0-darwin-x64.tar.gz"
    sha256 "7f5464d113dffd0627f926b15a547813037a94843908fa356e7141c7485493b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4123.0.0-darwin-arm64.tar.gz"
      sha256 "88dc8e10ce09fccf3ef140a4f510c6bc25b7ae911442f7108d3beecca021faae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4123.0.0-linux-x64.tar.gz"
    sha256 "3a0f3729f6d72790870e6c4099be84d1c9b2d0eedfdc65605587613490eb33a7"
  end
  version "4123.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
