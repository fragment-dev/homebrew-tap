require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3703.0.0-darwin-x64.tar.gz"
    sha256 "d8aea7e198b29c8de829b5d66521a125f2182c24a65d1a3baf13fd75b5eead52"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3703.0.0-darwin-arm64.tar.gz"
      sha256 "d9a42e261880ca190a5cf27c1e42d6e790e67fcfba4a37db51a87d9d8fb6187c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3703.0.0-linux-x64.tar.gz"
    sha256 "251a21759a4d37bdcc09023ccbd5f4ec237a4a589eadb0bed06de2d1ff1fa88c"
  end
  version "3703.0.0"
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
