require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5647.0.0-darwin-x64.tar.gz"
    sha256 "a4f2929abe693021437964fc8701d1f6f2dd6f32452130f199efb987e6cd3538"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5647.0.0-darwin-arm64.tar.gz"
      sha256 "a109cccb5f9203bcdeab8173cc8574cdefd88a4808ea202f3d6665b16fc5fcb7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5647.0.0-linux-x64.tar.gz"
    sha256 "8ed32fca9924dd2d5b274151c338f36c3903ce9d00993308e4f306fd34c01fda"
  end
  version "5647.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
