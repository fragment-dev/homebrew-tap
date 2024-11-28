require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5839.0.0-darwin-x64.tar.gz"
    sha256 "d2f814d4b5611c7d1884c26c6925183bb8a3498b3b131cfe20e785640a2214f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5839.0.0-darwin-arm64.tar.gz"
      sha256 "f5a43f290835e786d8b02b8e17cf45c816dab3603d985eea3eaf212e3436b1e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5839.0.0-linux-x64.tar.gz"
    sha256 "3ebdab34e187130a7580be2ef15d11e6124b808b23456daf84dc4c59b14c204d"
  end
  version "5839.0.0"
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
