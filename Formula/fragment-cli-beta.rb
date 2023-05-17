require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2682.0.0-darwin-x64.tar.gz"
    sha256 "bf1da275482805655c9151d405df2a531cd134e989676da1edac3bf97c489154"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2682.0.0-darwin-arm64.tar.gz"
      sha256 "5f74588044642ef768decba1fc889bb6848a0d95653d1bc58a7fce2022d4a0e7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2682.0.0-linux-x64.tar.gz"
    sha256 "cef6e60f5966581d722c38279a7dc6e2542a90f90383e5d27c78126a5292414c"
  end
  version "2682.0.0"
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
