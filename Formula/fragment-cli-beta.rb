require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3519.0.0-darwin-x64.tar.gz"
    sha256 "cd7973965e733a8d756f9a593483ad11ab554f751ed3f7a06c35ccfa82fdd107"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3519.0.0-darwin-arm64.tar.gz"
      sha256 "c5428f0125509f656d1854aa3024e0ac2f7d1219b71bc790fbba70f6661c5c4f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3519.0.0-linux-x64.tar.gz"
    sha256 "1c09866d46d597ae1b63a436f0997e0938a1ac3844d983abee68e6f25d94c5fa"
  end
  version "3519.0.0"
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
