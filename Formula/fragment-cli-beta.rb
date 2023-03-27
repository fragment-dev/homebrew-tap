require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2282.0.0-darwin-x64.tar.gz"
    sha256 "76e0942c28a1488c8e16e34ee7de05060fe8304c9bd523ee6f34f0d75d9569f4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2282.0.0-darwin-arm64.tar.gz"
      sha256 "678e58ca1c88b094e8d1389d6c0e199c66c59f8b2ef9012e22c875601c4dac36"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2282.0.0-linux-x64.tar.gz"
    sha256 "47ca92f0a4b485550be27fa691d18122486facc58a553b41f3acdae9dfd138b5"
  end
  version "2282.0.0"
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
