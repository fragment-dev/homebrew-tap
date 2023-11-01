require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "{{{darwinX64Url}}}"
    sha256 "{{darwinX64Shasum}}"
    on_arm do
      url "{{{darwinArm64Url}}}"
      sha256 "{{darwinArm64Shasum}}"
    end
  end
  on_linux do
    url "{{{linuxX64Url}}}"
    sha256 "{{linuxX64Shasum}}"
  end
  version "{{version}}"
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
