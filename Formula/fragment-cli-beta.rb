require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2586.0.0-darwin-x64.tar.gz"
    sha256 "f39dd0d60229a65d19de0b390e6ebf3fe4d5122f4f7237f6ee4352e41961b71b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2586.0.0-darwin-arm64.tar.gz"
      sha256 "85f1c124c7bc42fcbaf63236f64facc450f34c756738f6e667ffaa3ee7d801b9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2586.0.0-linux-x64.tar.gz"
    sha256 "e7ab56c5e376141d2d0fdc1b9f76655135656e15a64f48a3d93e051f8c50b91e"
  end
  version "2586.0.0"
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
