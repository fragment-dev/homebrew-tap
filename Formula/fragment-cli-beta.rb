require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3506.0.0-darwin-x64.tar.gz"
    sha256 "a990df15a23e5b5075a31c186576e384c8f024a8ba5ec205ca1e126c7175ff6e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3506.0.0-darwin-arm64.tar.gz"
      sha256 "ca0b199ffeceab151c994f5fee51db3b582d1c3d0a1d4f63f7e1bdd6c8bce715"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3506.0.0-linux-x64.tar.gz"
    sha256 "75127daac1eccc606492a5261cc82ef1b3702e4298cc6b772e16c1949749dc62"
  end
  version "3506.0.0"
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
