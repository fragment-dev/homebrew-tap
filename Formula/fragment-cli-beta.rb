require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5368.0.0-darwin-x64.tar.gz"
    sha256 "aefac31182a3c14c1b14427b61b26659bce48f3fd0d891617aa864f9343cc809"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5368.0.0-darwin-arm64.tar.gz"
      sha256 "9a862e14d5536ad311d6ceac68d4638b68f3996c51c03cf3a234b7d6d522be32"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5368.0.0-linux-x64.tar.gz"
    sha256 "4ce5f00057c0df818cf784d203bc386fba36888124e976d445f5bd45d568ad88"
  end
  version "5368.0.0"
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
