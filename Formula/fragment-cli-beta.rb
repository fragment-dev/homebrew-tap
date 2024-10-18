require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5678.0.0-darwin-x64.tar.gz"
    sha256 "122f7613b3412ef7bf01a40b2ab20ed63894b6c3db0f968453cd597a3c40b0a6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5678.0.0-darwin-arm64.tar.gz"
      sha256 "57a331677ec1cdd8136ae23d127d8d0153e6355db9560e5fdb8a7b86d9af248d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5678.0.0-linux-x64.tar.gz"
    sha256 "a7b4909447f7cc18ad1a15d5fe259a514e8588eacb9ffd507df711ef24387e7a"
  end
  version "5678.0.0"
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
