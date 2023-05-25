require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2742.0.0-darwin-x64.tar.gz"
    sha256 "1ff1174baf7a4e9b838f03f3aa491f6c0476d51cdee06219c6c9a4126d148778"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2742.0.0-darwin-arm64.tar.gz"
      sha256 "50a4a5057f7e63e98225cb49482682a6839a872ab27cb7a60f67157fb0e362eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2742.0.0-linux-x64.tar.gz"
    sha256 "0937f2fd829f8bcbe5576ca672b384bf4074322b13c8a683b654b588eaabf206"
  end
  version "2742.0.0"
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
