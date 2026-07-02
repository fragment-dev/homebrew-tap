require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8802.0.0-darwin-x64.tar.gz"
    sha256 "13946914c61cb8922346c1cde41f9a50eec2122ef3b08c9e1a8a0891e6e4b71a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8802.0.0-darwin-arm64.tar.gz"
      sha256 "7c794938491849b1df23cf5151ab542fbf77e619ad397d15ae05cc195b865fb9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8802.0.0-linux-x64.tar.gz"
    sha256 "a5c1f8696fc7b5c6858b6f8dd0d01169dbd79c13a747c7e7e470a0a647989e31"
  end
  version "8802.0.0"
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
