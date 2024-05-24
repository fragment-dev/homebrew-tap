require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5118.0.0-darwin-x64.tar.gz"
    sha256 "b8b80c9d37e06d6a11f79136b63ecb315c2057203977728b1a155da5b77af138"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5118.0.0-darwin-arm64.tar.gz"
      sha256 "50e35744c8b04c7c6bc5a6c7aa7e4afa95cc91a6d69dcbd56a319c7092e9d8b3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5118.0.0-linux-x64.tar.gz"
    sha256 "55dbe02fd047d628aa973b7638ed217aecfe332f6e1bf45ddde32db95f9bde9c"
  end
  version "5118.0.0"
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
