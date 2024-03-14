require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4766.0.0-darwin-x64.tar.gz"
    sha256 "bc7351b4c1c2311e45ead84919919c7d4020e23b7e65bb47810882f4d10c8b79"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4766.0.0-darwin-arm64.tar.gz"
      sha256 "96b205544c484ee41e70c268a913b4ca9f24c27a43011fd77c84bae35a2c2832"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4766.0.0-linux-x64.tar.gz"
    sha256 "720302ea35dace6cf3a40d96620118a5d794bef540c0793385113745900f3a89"
  end
  version "4766.0.0"
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
