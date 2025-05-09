require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.9-darwin-x64.tar.gz"
    sha256 "63e30fd08cefd1a25f15b220f580affb1c90072acfc19493c527859f02a96984"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.9-darwin-arm64.tar.gz"
      sha256 "561757b9f57b0cc81813054187b6004b5673de098512a8bbb8a9d7bd0d52884e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.9-linux-x64.tar.gz"
    sha256 "fbbeb5cc8331110f4ec17a8991c786a4ac8dbbb0d0981bc998673fd749565487"
  end
  version "2025.5.9"
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
