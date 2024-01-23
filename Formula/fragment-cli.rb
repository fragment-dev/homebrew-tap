require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.22-1-darwin-x64.tar.gz"
    sha256 "f06fdb1a1902c67815868032142fdcbb7bdbfad9fc9ace9e1235a89629c79cc0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.22-1-darwin-arm64.tar.gz"
      sha256 "1da5bb7902b3e0ff35be1bf4d673d6abdce8ec09957791003f48110d832cb005"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.22-1-linux-x64.tar.gz"
    sha256 "3b10aac5b631fa5e5ea449bb3f0bb3097c5d2049c47d3d6d3c0a6f8a03f3c234"
  end
  version "2024.1.22-1"
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
