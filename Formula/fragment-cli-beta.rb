require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2447.0.0-darwin-x64.tar.gz"
    sha256 "8e042652fcd948bf8171e56b3ef4896aba97f653e7dd26c62dbb0a08d3dec359"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2447.0.0-darwin-arm64.tar.gz"
      sha256 "ae0371ae1e8b29049ffebbf1fef1ea1547426b5c02390489a59bad0933d1b653"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2447.0.0-linux-x64.tar.gz"
    sha256 "a0ce48faf6927cb426a6484e1e3e9655046ea951e321b9beb377b02d5efa634e"
  end
  version "2447.0.0"
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
