require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3135.0.0-darwin-x64.tar.gz"
    sha256 "a93f9f262076c0627961fc69b145735881cd5a849cd8f6776eef4b8761c4c1c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3135.0.0-darwin-arm64.tar.gz"
      sha256 "f4351925f8e3a97f686662549eae3dd183ab2b6f9104b934f0d9e27e46e953a2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3135.0.0-linux-x64.tar.gz"
    sha256 "2546bd2de77e0a332a82040ca0bc41f72f8df5df8a5611053ea9dde29bce2e72"
  end
  version "3135.0.0"
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
