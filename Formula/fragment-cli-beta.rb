require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3446.0.0-darwin-x64.tar.gz"
    sha256 "91d09bdf161bce40378555c50b8bbe8fbe668db8142fc3dd0ac48c288c8fe51f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3446.0.0-darwin-arm64.tar.gz"
      sha256 "93c3ecd36dc120a99b44d9dacb506a8dfced45c4303e823e5b4d33c52f8d2c0f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3446.0.0-linux-x64.tar.gz"
    sha256 "1a539c341ba122533b99349cf2da6a3dc01c51769efecbadf86a652dd8d71ca7"
  end
  version "3446.0.0"
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
