require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5178.0.0-darwin-x64.tar.gz"
    sha256 "56161c650840da88ccc5b48ab2b08817b4f6f1c8ebeabb58503f485f24a21898"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5178.0.0-darwin-arm64.tar.gz"
      sha256 "9285d203261a21c2d8d2cf584277d509ced1921d30a52c80ff72e1d26a435f2b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5178.0.0-linux-x64.tar.gz"
    sha256 "2f65640f09deb83fbfaf0b01765caf76b1f055272a1f0bd8d23060a9a3e29871"
  end
  version "5178.0.0"
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
