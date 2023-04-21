require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2498.0.0-darwin-x64.tar.gz"
    sha256 "e3ac637c0d7670fae72fa5de92adea54dbbaffaad39e7f0c439870f66260f682"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2498.0.0-darwin-arm64.tar.gz"
      sha256 "eeee38e584e0ae5676eef8f149e612a06c4062c605ce4b322dc3bc09384b52a4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2498.0.0-linux-x64.tar.gz"
    sha256 "e1816caf4d7092c3c203fe0d9d97c957f5b6dca6150c70108bfc302fb121dda9"
  end
  version "2498.0.0"
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
