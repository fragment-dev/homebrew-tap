require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5542.0.0-darwin-x64.tar.gz"
    sha256 "025b82dec39ad781470259153ee667c3fbfb2712f7ef686021ab71d5a60ccd97"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5542.0.0-darwin-arm64.tar.gz"
      sha256 "2515be98013a9f9a531aed88f811d2c1b62002bc4fd760504d8fbfd28e62c91f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5542.0.0-linux-x64.tar.gz"
    sha256 "7a2e5c15ed5a4e595a25fe95d74d148b32d2352de4d393438d1378c83f62b4dc"
  end
  version "5542.0.0"
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
