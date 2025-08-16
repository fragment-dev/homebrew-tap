require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6971.0.0-darwin-x64.tar.gz"
    sha256 "8544198a327dd7e07eb26290f975b6cd066cfddd06ff9a735bb732153a469889"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6971.0.0-darwin-arm64.tar.gz"
      sha256 "56c13d678aed421b739cc593d61b9054547fe0545229de15ded9da1ee4871c3a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6971.0.0-linux-x64.tar.gz"
    sha256 "0bfc6ea90cf388c05259a0a348d084ada8a60e3bb261e485eac4199b8a1bc424"
  end
  version "6971.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
