require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3492.0.0-darwin-x64.tar.gz"
    sha256 "a8dbee748bdd4fe7db0c9ca6a975d6b8db321986448bf14b1d625c95bc94cfae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3492.0.0-darwin-arm64.tar.gz"
      sha256 "5ad21359f11579a993fb03bd5ab84652e001705a9a575b7e52435f2df53abd35"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3492.0.0-linux-x64.tar.gz"
    sha256 "4d44b2288567570d0559d68efe5c2976c63030989b0bc8dd07cb9ae69b9fedce"
  end
  version "3492.0.0"
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
