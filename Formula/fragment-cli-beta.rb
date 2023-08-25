require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3394.0.0-darwin-x64.tar.gz"
    sha256 "b9b3d126071a5c39aae069104ca70bd31d6a8f81cea3c36284d691a00386c0d1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3394.0.0-darwin-arm64.tar.gz"
      sha256 "64d58156809367924177cd8873a2a727da89f8d1b24d45e6b902302d5b2038f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3394.0.0-linux-x64.tar.gz"
    sha256 "5c0e0d7a18fe536e39d90fc0196a6f01c96e07ed634f7fce8b8793211e075f92"
  end
  version "3394.0.0"
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
