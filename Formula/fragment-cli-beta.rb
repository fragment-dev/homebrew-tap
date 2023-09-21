require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3635.0.0-darwin-x64.tar.gz"
    sha256 "dba90d77fcd7056fe313604fc9be9838723695f8b99e8d8f7aca279025b8e4af"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3635.0.0-darwin-arm64.tar.gz"
      sha256 "72a89307aa232e6354adc5631a81f21e6674266f748e7495fcd798a595415667"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3635.0.0-linux-x64.tar.gz"
    sha256 "323fc645b5cb21639f687a63798942085df8fd8e88c1d1dde9771a5586d44902"
  end
  version "3635.0.0"
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
