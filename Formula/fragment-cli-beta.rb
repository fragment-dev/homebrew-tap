require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3501.0.0-darwin-x64.tar.gz"
    sha256 "04c6fdeff3291c2d751fef4432d690586afe883b4835a6c2ad6072328e83a86a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3501.0.0-darwin-arm64.tar.gz"
      sha256 "42740e2be38091662b09cb96af20d4273d27cbb620a54c8cb40306c2062607ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3501.0.0-linux-x64.tar.gz"
    sha256 "54820fe0cddf91830f1588af74c73586b02ff83dd75bac8cead4095b137d1b24"
  end
  version "3501.0.0"
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
