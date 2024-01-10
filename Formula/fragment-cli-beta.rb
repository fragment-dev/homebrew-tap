require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4306.0.0-darwin-x64.tar.gz"
    sha256 "73e828ba80a5ab9119100e6157507813c92eca582c67b816972c09268ab788d1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4306.0.0-darwin-arm64.tar.gz"
      sha256 "69bb7eeabc8b472a3a5aabb8026788fbc586881c8ca7b934b1e3654cc127e765"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4306.0.0-linux-x64.tar.gz"
    sha256 "4ff142f2ace9ccdd7f60ba9a3b66a2fdff6ce3ab96dab47f778bf1bff18980bb"
  end
  version "4306.0.0"
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
