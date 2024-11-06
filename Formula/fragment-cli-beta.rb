require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5733.0.0-darwin-x64.tar.gz"
    sha256 "e5095ca314c6795097189f1bb2e585fc38be0af3007478533b0946e248b28ba1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5733.0.0-darwin-arm64.tar.gz"
      sha256 "d78138edef5e38afd371af159e3e2ca145eaa50966f572b0f0979c503f23b56f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5733.0.0-linux-x64.tar.gz"
    sha256 "87cc75d181cda94a9542f702e22039b317d064521f2af9ec6ccc047fae6281c9"
  end
  version "5733.0.0"
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
