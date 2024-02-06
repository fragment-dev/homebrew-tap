require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4501.0.0-darwin-x64.tar.gz"
    sha256 "a0b6b052d5da640c9dd2c9e505620a22c720f5a5c6da2a787f54b3074736d601"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4501.0.0-darwin-arm64.tar.gz"
      sha256 "3794110d0152b35fa3cc01607ba62cc50b9a7c8c16cccb5269ad05d9f7e3e1e8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4501.0.0-linux-x64.tar.gz"
    sha256 "512359654196dc6541645b6d6a009a701bf8cc198714e34a13fae74e6b24fd95"
  end
  version "4501.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
