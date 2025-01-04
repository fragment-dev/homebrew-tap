require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6038.0.0-darwin-x64.tar.gz"
    sha256 "07e145371052e7f0a6ef17f4c0ad36abcfbcf46ea41110a67fe679ef3f222a8b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6038.0.0-darwin-arm64.tar.gz"
      sha256 "8a3702da06c522292643f7a5c12cfe64f798ca7fc4f542f807b70f9e54d2686a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6038.0.0-linux-x64.tar.gz"
    sha256 "cadc10ee6f0d74f009e62fcf623f3bee6465f34c20b4587b8dab6dd00559b881"
  end
  version "6038.0.0"
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
