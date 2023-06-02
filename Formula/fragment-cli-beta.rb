require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2789.0.0-darwin-x64.tar.gz"
    sha256 "e7b2cc507ac2b56059a3c1bc0579653d0fa4d0bc0e06775ed499b3856148e735"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2789.0.0-darwin-arm64.tar.gz"
      sha256 "925120cbbd0036973bc046315acbfad0c62d2a9afa075f645166f46eecd310d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2789.0.0-linux-x64.tar.gz"
    sha256 "2b3f280f65fc27fdab0f37b7a4eafd8de5abcb6a3bef8d1893c49332756675ed"
  end
  version "2789.0.0"
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
