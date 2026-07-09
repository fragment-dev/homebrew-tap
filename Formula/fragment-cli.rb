require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.7.9-4-darwin-x64.tar.gz"
    sha256 "10568d74562edcc660a68e5a76900dc9c9aa86bd907e934b70462233ecdb0049"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.7.9-4-darwin-arm64.tar.gz"
      sha256 "12f5ec37be2ea26a58ae3e4fce953d7e240bfc6164039c16b1f0defc6a92397b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.7.9-4-linux-x64.tar.gz"
    sha256 "51bc66c3bcb240fab1f3661636bbbf255485968ac03593a160a7a899830de46a"
  end
  version "2026.7.9-4"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    # The tarball ships without a Node runtime; point the launcher's
    # $DIR/node lookup at Homebrew's keg-only node@20.
    rm_f libexec/"bin/node"
    (libexec/"bin").install_symlink Formula["node@20"].opt_bin/"node" => "node"
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
