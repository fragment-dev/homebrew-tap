require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3102.0.0-darwin-x64.tar.gz"
    sha256 "aaf92c3c79f22ccf806b173cd448054444c9e63c4ee9a549119355016eed5926"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3102.0.0-darwin-arm64.tar.gz"
      sha256 "be0fac211c815b67572b77e42b04a6d014c128ed8e5db57166455fd572f0fce1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3102.0.0-linux-x64.tar.gz"
    sha256 "a48f5d1c2b1e8ec41de63c3916bfbe69154b2632df9f8c65acf50722d9a29e50"
  end
  version "3102.0.0"
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
