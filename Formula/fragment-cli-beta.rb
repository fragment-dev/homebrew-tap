require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v9309.0.0-darwin-x64.tar.gz"
    sha256 "4726faf1aba9aae0d7e1e1bfa034f06f7028ab28d9077907a9d6a2fbb1211c65"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v9309.0.0-darwin-arm64.tar.gz"
      sha256 "bc74dcd4e2b2a73851d8cb9a205e9ab555c47203bece85fad1b4f2a8d3cfaaf6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v9309.0.0-linux-x64.tar.gz"
    sha256 "0237b0d9d1e9c01f054af66907bc134b8718b17cb04d608cfb6f60199cd959c8"
  end
  version "9309.0.0"
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
