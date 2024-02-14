require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4556.0.0-darwin-x64.tar.gz"
    sha256 "d422dace5a899e88e27d2e6d4ea193d43fa849bdd176a742e74cd270ed62371c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4556.0.0-darwin-arm64.tar.gz"
      sha256 "1ba91d3e67d2dec7e45d676c6bd00e12609e0b41af7fa1e3f674c9cbd3c9a84f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4556.0.0-linux-x64.tar.gz"
    sha256 "3d39218fb0cfc03aa6ad46d6ea45b05625d979e26cff0513682df4eb6768e6b6"
  end
  version "4556.0.0"
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
