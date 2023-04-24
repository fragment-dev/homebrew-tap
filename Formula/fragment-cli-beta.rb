require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2511.0.0-darwin-x64.tar.gz"
    sha256 "b689080f72964a5f5c367419f5230cc240507c4f5cb371437426c3bcd716bc8c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2511.0.0-darwin-arm64.tar.gz"
      sha256 "9ac3e02404572a08430bddb34eb63e843ad5e48d4b69afa8b68fdebbdecec277"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2511.0.0-linux-x64.tar.gz"
    sha256 "fcd3023820a7a2050f7817f23a679de2a3093f49d8f6fb59803e786e5dc29c8f"
  end
  version "2511.0.0"
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
