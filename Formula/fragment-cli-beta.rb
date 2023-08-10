require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3281.0.0-darwin-x64.tar.gz"
    sha256 "951579a2c306e85e47630d9a01f199aaccb2565213527802af694cd74967d4a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3281.0.0-darwin-arm64.tar.gz"
      sha256 "088ebe043cff26e51aa49d20e290a23d7048f8a6c1ffcb03f260e38d736e022a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3281.0.0-linux-x64.tar.gz"
    sha256 "13816e81521076d77635c0b9a052777b18040db1b239d8781dd7f9ed920b6957"
  end
  version "3281.0.0"
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
