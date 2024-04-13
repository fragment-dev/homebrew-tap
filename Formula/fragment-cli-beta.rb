require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4889.0.0-darwin-x64.tar.gz"
    sha256 "4d167c0fe5475db606d69802df945bb0e8eb62e620c29195d1e3dbdedd20eb8e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4889.0.0-darwin-arm64.tar.gz"
      sha256 "5a125872d5b51be05a231c058fa71dbe1f3a12d8434429336dc6c5eeb2dcb087"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4889.0.0-linux-x64.tar.gz"
    sha256 "55b8b099447b4dc5752748bf412e3b836f596c9c712a490153f9563566dd99a1"
  end
  version "4889.0.0"
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
