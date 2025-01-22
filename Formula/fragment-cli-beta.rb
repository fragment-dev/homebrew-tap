require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6111.0.0-darwin-x64.tar.gz"
    sha256 "d5a24535a09d8efd2fc01aa8c09e166777cb089d40815ceeb5c8baebddf8f6df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6111.0.0-darwin-arm64.tar.gz"
      sha256 "f8a2de18d4cc92cbaeb99af2510071e2460052c700d623241c2d7b8006d596e5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6111.0.0-linux-x64.tar.gz"
    sha256 "0e5d66297f0713bf237595bed256225abf8c6eef4e9d3316f3745ae0eb3878bd"
  end
  version "6111.0.0"
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
