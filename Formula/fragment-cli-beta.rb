require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3522.0.0-darwin-x64.tar.gz"
    sha256 "3df43a8747727a1f3840c5c7d9e57c2aa82806eb0548f558c024e42be09aa6ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3522.0.0-darwin-arm64.tar.gz"
      sha256 "b93bb9f826a3b125c9f85304e41a1520222c5ebfc9c9cb80a31760b5d380365a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3522.0.0-linux-x64.tar.gz"
    sha256 "0ad11ea5720e871de8e4296669c6ed89cf47f9155aee7000fc6b754d202e6b13"
  end
  version "3522.0.0"
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
