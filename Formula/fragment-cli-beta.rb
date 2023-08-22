require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3356.0.0-darwin-x64.tar.gz"
    sha256 "05422ed9f2efe42de9b64e9de94459320b2583b7d49596025da69d94e930fe1d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3356.0.0-darwin-arm64.tar.gz"
      sha256 "0988d8d9aab866cd6690cf11559f8e466084ae34407ed62ba8ad3f6b5fb9ed74"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3356.0.0-linux-x64.tar.gz"
    sha256 "4a4be1443f6ce171aec4f78d0eba19314cbe215950fdf24b507f6c6c36eafb31"
  end
  version "3356.0.0"
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
