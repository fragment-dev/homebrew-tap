require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5776.0.0-darwin-x64.tar.gz"
    sha256 "d65a70bf4a384ba34c0d17db14302ed4b9c0ae888a7d83a455cbfa12f240f134"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5776.0.0-darwin-arm64.tar.gz"
      sha256 "768800ec5cbb7bf57fc8964447f4e0c68992a15b9f13270b9a224b0963884d2b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5776.0.0-linux-x64.tar.gz"
    sha256 "a437eec12052466a1ad63553f2c16efa17438f9dc54535f456db471438b01930"
  end
  version "5776.0.0"
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
