require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.2-darwin-x64.tar.gz"
    sha256 "2bc9ef81952500cf630b49e9f60e5a3038356def0706b24a6cd1fe0b69aebca8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.2-darwin-arm64.tar.gz"
      sha256 "d788d9bb0c1aed6e3c011c1ebc8847ce33e363d14bbbd68a5083ad0be90db6f0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.2-linux-x64.tar.gz"
    sha256 "309b120ccefd412a454678658f23306794c788cb76df729f3800c6972c88fc03"
  end
  version "2023.5.2"
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
