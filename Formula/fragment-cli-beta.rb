require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5286.0.0-darwin-x64.tar.gz"
    sha256 "6be453e377d3d5b7db052ca6e579930d1ff23db1e67fff4137ff61562b3e21f8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5286.0.0-darwin-arm64.tar.gz"
      sha256 "033b46d34c90d1a4d813ef491298e36476ea8870d40d758d4fe2b4c80b4de455"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5286.0.0-linux-x64.tar.gz"
    sha256 "d16b3527ef0fb2b182dc44f3fe7695c02ba12dd9551bb1f14f2b1972c8671914"
  end
  version "5286.0.0"
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
