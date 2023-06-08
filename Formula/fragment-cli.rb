require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.7-darwin-x64.tar.gz"
    sha256 "df7322051b92d3e8a2b494f195b044f4a9886b99d6bf8550859514313db010c5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.7-darwin-arm64.tar.gz"
      sha256 "abe8b5976f2a8ff9eea1b0f4d7410ccc70aca09333cbcdebfda16a5474da710c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.7-linux-x64.tar.gz"
    sha256 "7b4cfa62813f3f744efc4a9136b48c8194460869f954425135614810456ca552"
  end
  version "2023.6.7"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
