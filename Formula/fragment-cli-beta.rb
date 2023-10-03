require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3755.0.0-darwin-x64.tar.gz"
    sha256 "a681ed0adc117074d31fa283a143b5cdf61fbf676be83ea99e066fb682646ab2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3755.0.0-darwin-arm64.tar.gz"
      sha256 "bde9a504210d9d31fd1d3ab2720ffc2207345105ff3774eb24c3044a2c47ba70"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3755.0.0-linux-x64.tar.gz"
    sha256 "e643e3c62875e1933678d946b15a506a2917fddc5624a75f3ebc688b06704687"
  end
  version "3755.0.0"
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
