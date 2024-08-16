require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5516.0.0-darwin-x64.tar.gz"
    sha256 "dd8ce3b6dee29fb51c2ecc3f8166305410512b757e91748b4d2495525623807b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5516.0.0-darwin-arm64.tar.gz"
      sha256 "a2f76ba3596acdc70a7e88e92506b0cb5dae53102570b0435b2b9dd3fa56bca7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5516.0.0-linux-x64.tar.gz"
    sha256 "d4c58bcb095c4cfb67ecd0bc86c9b3d030a2974e7a80c39b0f6134b6d1cd3203"
  end
  version "5516.0.0"
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
