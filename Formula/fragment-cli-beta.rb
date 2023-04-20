require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2490.0.0-darwin-x64.tar.gz"
    sha256 "7d5eac9906bb83325e95196cc6359fb3c55bef274a3172e584d765a96f5f99da"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2490.0.0-darwin-arm64.tar.gz"
      sha256 "1a09f35e85fa54ca18e4cd7c4a10929078c792fc275801443cc962d262a1d4be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2490.0.0-linux-x64.tar.gz"
    sha256 "f2b1fda1d423a3199d7dd8a92804361b8ff8e8798f2cd9f491da6f68d9285bb3"
  end
  version "2490.0.0"
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
