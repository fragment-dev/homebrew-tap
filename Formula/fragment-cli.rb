require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.17-darwin-x64.tar.gz"
    sha256 "9c50aed2c47ce536aa45e761240edb0655024378cc189e19b20464fa81109055"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.17-darwin-arm64.tar.gz"
      sha256 "5aef36279bb8d11d476edd91e739250c0aef5276773505db8e7fc306f765b1c1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.17-linux-x64.tar.gz"
    sha256 "821163fa976de2d15c304a11294b6c0ab6a944934546514909c8b89e6076b46e"
  end
  version "2025.1.17"
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
